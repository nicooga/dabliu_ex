defmodule DabliuEx.Image do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original]

  def __storage, do: Arc.Storage.Local
end
