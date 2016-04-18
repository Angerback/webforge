class RutValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)

  	if value == nil || value == ""
  		record.errors[attribute] << (options[:message] || "inválido.")
  	else
	    sum = 0
	    rut = value
	    rutString = (rut.gsub /\.|-/, '' ).reverse

	    for  i in  1..(rutString.length-1) do
			if ( i <= 6 )
				sum += ( i + 1 ) * rutString[i].to_i
			else
				sum += ( i - 5 ) * rutString[i].to_i
			end
		end

		if rutString[0]=='0' && ( ( 11 - ( sum % 11 )) != 11 )
			record.errors[attribute] << (options[:message] || "inválido")
		elsif rutString[0].downcase =='k' && ( ( 11 - ( sum % 11 )) != 10 )
			record.errors[attribute] << (options[:message] || "inválido")
		elsif  rutString[0].downcase!='k' && rutString[0]!='0' && ( ( 11 - ( sum % 11 )) != rutString[0].to_i )
			record.errors[attribute] << (options[:message] || "inválido")
		end
	end
  end
end
