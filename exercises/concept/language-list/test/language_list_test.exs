defmodule LanguageListTest do
  use ExUnit.Case

  describe "new/0" do
    @task_id 1
    test "new list" do
      assert LanguageList.new() == []
    end
  end

  describe "add/1" do
    @task_id 2
    test "add a language to a list" do
      language = "Elixir"
      list = [language]

      assert LanguageList.new() |> LanguageList.add(language) == list
    end

    @task_id 2
    test "add several languages to a list" do
      list =
        LanguageList.new()
        |> LanguageList.add("Clojure")
        |> LanguageList.add("Haskell")
        |> LanguageList.add("Erlang")
        |> LanguageList.add("F#")
        |> LanguageList.add("Elixir")

      assert list == ["Elixir", "F#", "Erlang", "Haskell", "Clojure"]
    end
  end

  describe "remove/0" do
    @task_id 3
    test "remove on an empty list results in error" do
      assert_raise ArgumentError, fn -> LanguageList.new() |> LanguageList.remove() end
    end

    @task_id 3
    test "add then remove results in empty list" do
      list =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.remove()

      assert list == []
    end

    @task_id 3
    test "adding two languages, when removed, removes first item" do
      list =
        LanguageList.new()
        |> LanguageList.add("F#")
        |> LanguageList.add("Elixir")
        |> LanguageList.remove()

      assert list == ["F#"]
    end
  end

  describe "first/0" do
    @task_id 4
    test "first on an empty list raises an error" do
      assert_raise ArgumentError, fn -> LanguageList.new() |> LanguageList.first() end
    end

    @task_id 4
    test "add one language, then get the first" do
      assert LanguageList.new() |> LanguageList.add("Elixir") |> LanguageList.first() == "Elixir"
    end

    @task_id 4
    test "add a few languages, then get the first" do
      first =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.add("Prolog")
        |> LanguageList.add("F#")
        |> LanguageList.first()

      assert first == "F#"
    end
  end

  describe "count/0" do
    @task_id 5
    test "the count of a new list is 0" do
      assert LanguageList.new() |> LanguageList.count() == 0
    end

    @task_id 5
    test "the count of a one-language list is 1" do
      count =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.count()

      assert count == 1
    end

    @task_id 5
    test "the count of a multiple-item list is equal to its length" do
      count =
        LanguageList.new()
        |> LanguageList.add("Elixir")
        |> LanguageList.add("Prolog")
        |> LanguageList.add("F#")
        |> LanguageList.count()

      assert count == 3
    end
  end

  describe "exciting_list?/1" do
    @task_id 6
    test "an exciting language list" do
      assert LanguageList.exciting_list?(["Clojure", "Haskell", "Erlang", "F#", "Elixir"])
    end

    @task_id 6
    test "not an exciting language list" do
      refute LanguageList.exciting_list?(["Java", "C", "JavaScript"])
    end
  end
end
