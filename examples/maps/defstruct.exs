defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    "Missing name for badge"
  end
end
