alias DabliuEx.{Repo, User, Catalog}

Enum.each [Catalog.Item, Catalog, User], &Repo.delete_all/1

Addict.Interactors.Register.call(%{
  "email"    => "2112.oga@gmail.com",
  "password" => "dabliu2016"
})

%Catalog{
  name: "Slips",
  items: [
    %Catalog.Item{position: 1},
    %Catalog.Item{position: 2}
  ]
}
|> Catalog.changeset
|> Repo.insert!
