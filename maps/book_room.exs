defmodule HotelRoom do
  def book(%{name: name, height: height})
  when height > 1.9 do
    "Need extra long bed for #{name}"
  end

  def book(%{name: name, height: height})
  when height < 1.3 do
    "Need low shower controls for #{name}"
  end

  def book(%{name: name}) do
    "Need regular bed for #{name}"
  end
end

IO.puts(HotelRoom.book(%{name: "renan", height: 2}) == "Need extra long bed for renan")
IO.puts(HotelRoom.book(%{name: "renan", height: 1}) == "Need low shower controls for renan")
IO.puts(HotelRoom.book(%{name: "renan", height: 1.5}) == "Need regular bed for renan")
