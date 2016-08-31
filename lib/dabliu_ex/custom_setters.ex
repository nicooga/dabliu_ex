defmodule DabliuEx.CustomSetters do
  defmacro def_custom_setter({key, _, [{arg_name, _, _}]}, do: block) do
    do_def_custom_setter(key |> Atom.to_string, arg_name, block)
  end

  defp do_def_custom_setter(key, arg_name, block) do
    quote do
      def apply_custom_setter(
        %{unquote(key) => match} = params,
        unquote(key)
      ) do
        unquote(Macro.var(arg_name, nil)) = match
        params |> unquote(__MODULE__).update_params(unquote(block))
      end
    end
  end

  def update_params(params, {key, value}), do: params |> Map.put(key, value)
  def update_params(params, %{} = values), do: params |> Map.merge(values)

  def apply_custom_setters(%{} = params) do
    Enum.reduce Map.keys(params), params, &apply_custom_setter(&2, &1)
  end

  def apply_custom_setter(%{} = params, _), do: params

  defmacro __using__(_env) do
    quote do
      import unquote(__MODULE__), only: [
        def_custom_setter:    2,
        apply_custom_setter:  2,
        apply_custom_setters: 1
      ]
    end
  end
end
