using UnicodePlots

###### for command-line input ######
# c = Array{Int64}(16)
#
# for i in 1:16
#     c[i] = parse(Int64, ARGS[1][i])
# end
#####################################

function manchester()
    temp = [0, 1, 1, 2]
    twos = [2, 2, 2, 2]

    x_bound = Array{Int64, 1}()
    y_bound = Array{Int64, 1}()

    man_0 = [1, 1, -1, -1]
    man_1 = [-1, -1, 1, 1]

    for i in 1:input_size
        a = (temp + twos * (i - 1))
        append!(x_bound, a)
        if bit[i] == 0
            append!(y_bound, man_0)
        elseif bit[i] == 1
            append!(y_bound, man_1)
        end
    end

    man = stairs(x_bound, y_bound,
                    width=60,
                    height=5,
                    xlim=[0, 40],
                    ylim=[-1, 1],
                    border=:bold,
                    title="Manchester Encoding",
                    color=:red,
                    grid=false,
                    canvas=BrailleCanvas);
    print(man)
end

function diff_manchester()
    init_0 = [0]
    init_1 = [1]
    temp = [0, 1, 1, 2]
    twos = [2, 2, 2, 2]

    x_bound = copy(init_0)
    append!(x_bound, temp)
    y_bound = copy(init_1)

    man_0 = [1, 1, -1, -1]
    man_1 = [-1, -1, 1, 1]

    if bit[1] == 0
        append!(y_bound, man_1)
        global tmp = man_1
    elseif bit[1] == 1
        append!(y_bound, man_0)
        global tmp = man_0
    end

    for i in 2:input_size
        a = (temp + twos*(i-1))
        append!(x_bound, a)
        if bit[i] == 0
            if tmp == man_1
                append!(y_bound, man_1)
                tmp = man_1
            elseif tmp == man_0
                append!(y_bound, man_0)
                tmp = man_0
            end
        elseif bit[i] == 1
            if tmp == man_1
                append!(y_bound, man_0)
                tmp = man_0
            elseif tmp == man_0
                append!(y_bound, man_1)
                tmp = man_1
            end
        end
    end

    man = stairs(x_bound, y_bound,
                    width=60,
                    height=5,
                    xlim=[0,40],
                    ylim=[-1,1],
                    border=:bold,
                    title="Differential Manchester Encoding",
                    color=:red,
                    grid=false,
                    canvas=BrailleCanvas);
    print(man)
end

function main()
    global input
    global bit = Array{Int64, 1}()

    while true
        cnt = 0
        bit = []
        print("\nPlease type in binary code: ")
        input = readline()
        global input_size = length(input)
        for i in 1:input_size
            push!(bit, parse(Int64, input[i]))
            if((bit[i] == 0) || (bit[i] == 1))
                cnt += 1
            end
        end
        if cnt == input_size
            break
        else
            println("Not binary code! Please type in binary code")
        end
    end

    println("length is ", input_size)

    manchester()
    diff_manchester()
end

main()
