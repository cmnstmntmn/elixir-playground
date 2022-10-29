defmodule KV.BucketTest do
  alias KV.Runtime.Server.Bucket
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert Bucket.get(bucket, "milk") == nil

    Bucket.put(bucket, "milk", 3)
    assert Bucket.get(bucket, "milk") == 3
  end

  test "remove value by key", %{bucket: bucket} do
    Bucket.put(bucket, "bobite", 1)
    assert Bucket.get(bucket, "bobite") === 1

    Bucket.delete(bucket, "bobite")
    assert Bucket.get(bucket, "bobite") === nil
  end
end
