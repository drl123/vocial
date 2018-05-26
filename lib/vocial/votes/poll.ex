defmodule Vocial.Votes.Poll do
  use Ecto.Schema
  import Ecto.Changeset
  alias Vocial.Votes.{Image, Option, Poll, VoteRecord}
  alias Vocial.Accounts.User

  schema "polls" do
    field :title, :string

    has_one     :image,         Image
    has_many    :options,       Option
    has_many    :vote_records,  VoteRecord
    belongs_to  :user,          User

    timestamps()
  end

  def changeset(%Poll{}=poll, attrs) do
    poll
    |> cast(attrs, [:title, :user_id])
    |> validate_required([:title, :user_id])
  end
end
