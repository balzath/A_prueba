class Item < ApplicationRecord

  def self.evaluar(cadena)
    estado = 'balanceado'
    if cadena.present?
      arreglo = cadena.chars
      array2 = []
      array3 = []
      arreglo.each do |caracter|
        if caracter == '('
          array2 << caracter
        elsif caracter == ')'
          array3 << caracter
        end 
      end
      if array2.count != array3.count
        estado = 'desbalanceado'
        if array2.count > array3.count
          diff = array2.count - array3.count
          carita_t = ':('
          if cadena.scan(/(?=#{Regexp.escape(carita_t)})/).count >= diff
            estado = 'balanceado'
          end
        else
          diff = array3.count - array2.count
          carita_f = ':)'
          if cadena.scan(/(?=#{Regexp.escape(carita_f)})/).count >= diff
            estado = 'balanceado'
          end
        end 
      end
      return estado
    else
      return estado
    end
  end

end
