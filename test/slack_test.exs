defmodule SlackTest do
  use ExUnit.Case

  setup do
    Slack.FakeSlack.start_link()
    :ok
  end

  describe "conversations/1" do
    test "should list all the channels" do
      IO.inspect Slack.conversations()
    end
  end

  describe "send_message/1" do

  end

  describe "send_message/3" do

  end

  describe "delete/2" do

  end

  describe "info/2" do

  end

  describe "history/2" do

  end
end
