defmodule Vocial.Votes.Poll do
  use Ecto.Schema
  import Ecto.Changeset
  alias Vocial.Votes.{Option, Poll}
  alias Vocial.Accounts.User

  schema "polls" do
    field :title, :string

    has_one     :image,   Vocial.Votes.Image
    has_many    :options, Option
    belongs_to  :user,    User

    timestamps()
  end

  def changeset(%Poll{}=poll, attrs) do
    poll
    |> cast(attrs, [:title, :user_id])
    |> validate_required([:title, :user_id])
  end
end
