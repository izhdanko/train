require_relative 'train/main.rb'

module Train
end

train = Train::Main.new

train.reduce! 10
train.move 105
train.gain! 125
train.move 105
train.reduce! 5
train.move 105
train.move 10
train.move 10
train.move 5
train.reduce! 10
train.move 1
