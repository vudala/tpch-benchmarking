pushd /home/queries > /dev/null

QUERIES=$(ls)

for Q in $QUERIES; do
    TIME_MS=$(psql -q -o /dev/null -c '\timing on' -f $Q | cut -d' ' -f2)
    echo $Q $TIME_MS
done

popd > /dev/null
