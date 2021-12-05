class Item < ApplicationRecord

  def self.evaluar(cadena)
    #mark 1
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

  def self.evaluar2(cadena)
    #mark 2
    estado = 'balanceado'
    if cadena.present?
      arreglo = cadena.chars
      eliminar = []
      aux = arreglo
      arreglo.each_with_index do |c,idx|
        if c == '('
          arreglo.each_with_index do |caracter,index|
            if caracter == ')' and eliminar.include?(index) == false and index > idx
              eliminar << idx
              eliminar << index
              break
            end
          end
        end
      end
      eliminar.sort.each_with_index do |e,i|
        aux.delete_at(e-i)
      end
      carita_t = ':('
      carita_f = ':)'
      n_caritas_t = cadena.scan(/(?=#{Regexp.escape(carita_t)})/).count
      n_caritas_f = cadena.scan(/(?=#{Regexp.escape(carita_f)})/).count
      aux = aux.join('')
      n_caritas_t_a = aux.scan(/(?=#{Regexp.escape(carita_t)})/).count
      n_caritas_f_a = aux.scan(/(?=#{Regexp.escape(carita_f)})/).count
      if n_caritas_t >= n_caritas_t_a
        aux = aux.gsub ":(", ""
      end
      if n_caritas_f >= n_caritas_f_a
        aux = aux.gsub ":)", ""
      end 
      if aux.include?(')') or aux.include?('(')
        estado = 'desbalanceado'
      end
      return estado
    else
      return estado
    end
  end

end
