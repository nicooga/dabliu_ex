defmodule DabliuEx.JsonApiView do
  defmacro preload(assocs) when is_list(assocs) do
    for assoc <- assocs do
      quote do: do_preload(unquote(assoc))
    end
  end

  defmacro preload(assoc) when is_atom(assoc), do: do_preload(assoc)

  defp do_preload(assoc) do
    quote do
      def unquote(assoc)(struct, _conn) do
        case struct.unquote(assoc) do
          %Ecto.Association.NotLoaded{} ->
            struct
            |> Ecto.assoc(unquote(assoc))
            |> Telmak.Repo.all
          other -> other
        end
      end
    end
  end

  defmacro __using__(_env) do
    quote do
      import unquote(__MODULE__), only: [preload: 1]
    end
  end
end
