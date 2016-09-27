def flatten(array)
  flattened = []

  array.each do |i|

    if i.is_a?(Array)
      flattened += flatten(i)
    else
      flattened << i
    end

  end

  flattened
end


def flatten(array, n=nil)
  flattened = []

  array.each do |el|

    if el.is_a?(Array)
      if n.nil?
        flattened += flatten(el, n)
      elsif n > 0
        flattened += flatten(el, n-1)
      else
        flattened << el
      end
    else
      flattened << el
    end

  end

  flattened
end
