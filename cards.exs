defmodule Help do
  def print_length(list) do
  IO.inspect(length(list), label: "Length")
  list
end
end


ranks =
  [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]

suits =
  [ "♣", "♦", "♥", "♠" ]

cards = for rank <- ranks, suit <- suits, do: {rank, suit}



cards
|> Enum.take_random(13)
|> Help.print_length
|> IO.inspect(label: "13 Random Cards")

cards
|> Enum.shuffle()
|> Enum.chunk_every(13)
|> Help.print_length
|> IO.inspect(label: "4 Hands of 13")
