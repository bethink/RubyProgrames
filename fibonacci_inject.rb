a = [1]
count=15
c=0
a.inject(1){|r, i| c+=1; ((c <= count) ? (a << r) : nil ); r += i; p(a); r }
