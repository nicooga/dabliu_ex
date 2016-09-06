defmodule DabliuEx.JsonApiView do
  defmacro __using__(_env) do
    quote do
      def preload(record_or_records, _conn, include_opts) do
        DabliuEx.Repo.preload(record_or_records, include_opts)
      end

      defoverridable [preload: 3]
    end
  end
end
