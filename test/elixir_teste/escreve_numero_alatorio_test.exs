defmodule ElixirTest.EscreveNumeroAleatorioTest do
    use ExUnit.Case
    import Mock

    test "Two random numbers" do
      ElixirTeste.EscreveNumeroAleatorio.escreve

      first_contend = File.read!(Path.join([
        :code.priv_dir(:elixir_teste),
        "arquivo.txt"
      ]))

      ElixirTeste.EscreveNumeroAleatorio.escreve

      second_contend = File.read!(Path.join([
        :code.priv_dir(:elixir_teste),
        "arquivo.txt"
      ]))

      assert first_contend != second_contend
    end

    test "Testando Mock" do
      :ets.new(:conteudos, [:set, :private, :named_table])
      with_mock File, [write!: fn (_path, conteudo) -> :ets.insert_new(:conteudos, {conteudo}) end] do
        ElixirTeste.EscreveNumeroAleatorio.escreve
        ElixirTeste.EscreveNumeroAleatorio.escreve
      end

      conteudos = :ets.tab2list(:conteudos)
      [primeiro_valor | conteudos] = conteudos
      [segundo_valor | _] = conteudos

      assert primeiro_valor != segundo_valor
    end
end
