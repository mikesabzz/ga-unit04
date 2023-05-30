const DEFAULT_BUCKET_SIZE = 5

const bucketSort = (arr, numBuckets) => {
    if (arr.length <= 0) {
        return arr
    }

    const bucketSize = numBuckets || DEFAULT_BUCKET_SIZE

    let minValue = arr[0]
    let maxValue = arr[0]

    // loop through array to determine the min and max values in arr

    for (let i = 1; i < arr.length; i++) {
        if(arr[i] < minValue) {
            minValue = arr[i]
        }
        else if(arr[i] > maxValue) {
            maxValue = arr[i]
        }
    }

    // Create the buckets
    // Number of buckets is determined by the difference between max and min value divided by buckets + 1

    let bucketCount = Math.floor((maxValue - minValue) / bucketSize) + 1
    const buckets = new Array(bucketCount) 

    for(let i = 0; i < buckets.length; i++) {
        // Set each bucket to an empty array
        buckets[i] = []
    }

    // Distribute between buckets
    for(let i = 0; i < arr.length; i++) {
        buckets[Math.floor((arr[i] - minValue) / bucketSize)].push(arr[i])
    }

    // Loop through each bucket and call a sort method
    arr = []
    for(let i = 0; i < buckets.length; i++) {
        buckets[i] = someOtherSort(buckets[i])
        arr = arr.concat(buckets[i])
    }

    // return sorted arr
    return arr
}

const someOtherSort = (arr) => {
    return arr.sort(function(a, b) {
        return a - b
    })
}

console.log(bucketSort([23, 32, 1, 56, 3, 10, 16, 40, 55, 2, 6, 16, 4, 12, 78, 98, 101]))