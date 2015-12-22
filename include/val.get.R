# get top-n nearest phrases from a single p-value with some randomness
val.getn = function (query = 0.051, n = 5L) {

  if (is.na(query) | query < 0L | query > 1L) {

    return(list('key' = query, 'val' = "Whose p-value is this?"))

  } else if (query <= 0.050000 & query > 0) {

    return(list('key' = query, 'val' = "You're Significant!"))

  } else {

    val_diff = abs(key - query)
    val_diff_sort = sort(val_diff, index.return = TRUE)

    # if p+1 is in top n, then return top n with some randomness
    if (val_diff_sort$x[n + 1L] %in% val_diff_sort$x[1L:n]) {

      val_diff_sort_rdn = sort(jitter(abs(key - query),
                                      factor = 0.051),
                               index.return = TRUE)
      idx_rdn = val_diff_sort_rdn$ix[1L:n]
      idx = idx_rdn[sort(val_diff[idx_rdn], index.return = TRUE)$ix]

    } else {

      idx = val_diff_sort$ix[1L:n]

    }

    return(list('key' = key[idx], 'val' = val[idx]))

  }

}

# get top-1 nearest phrase from a single p-value with some randomness
val.getone = function (query = 0.051) {

  if (is.na(query) | query < 0L | query > 1L) {

    return(list('key' = query, 'val' = "Is that a real p-value?"))

  } else if (query <= 0.0500000 & query > 0L) {

    return(list('key' = query, 'val' = "You are significant!"))

  } else {

    topten = val.getn(query = query, n = 10L)
    idx_rnd = sample(1L:10L, 1L)

    return(list('key' = topten$'key'[idx_rnd], 'val' = topten$'val'[idx_rnd]))

  }

}
