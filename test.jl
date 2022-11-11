mutable struct Bar
    a
    b
end

bar = Bar(1, 2)
x = bar
x.a = 3
bar