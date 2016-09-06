defmodule DabliuEx.ArcModel do
  defmacro __using__(fields: attrs) do
    quote do
      use Arc.Ecto.Schema
      unquote(def_changeset_params_fixers(attrs))
    end
  end

  defp def_changeset_params_fixers(attrs) do
    Enum.map(attrs, &def_changeset_params_fixer/1)
  end

  defp def_changeset_params_fixer(attr) do
    key = Atom.to_string(attr)

    quote do
      def changeset(%{unquote(key) => %{
        "filename" => filename,
        "binary"   => binary
      }} = params) do
        params
        |> Map.put(unquote(key), %{
          filename: filename,
          binary:   Base.decode64!(binary)
        })
        |> changeset
      end
    end
  end
end
