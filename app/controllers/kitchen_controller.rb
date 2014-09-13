class KitchenController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def initialize
    @result = []
    @originator = 0
    @supporter = 1
    @grid_max = 16
    @pusher = 0
  end


  def prepare
    fib_num = params["fib_num"].to_i > @grid_max ? @grid_max : params["fib_num"].to_i
    @fib_salad = generate_fib 0,fib_num
  end


  def generate_fib count, fib_num
    if(count >= fib_num)
      return []
    else
      @finisher = @originator + @supporter
      @result << @originator
      @originator = @supporter
      @supporter = @finisher
      generate_fib count+=1, fib_num
    end

    until @result.length == @grid_max
      @result << " "
      @pusher+=1
    end

    return @result
  end


end
