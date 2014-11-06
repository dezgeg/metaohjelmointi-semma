vuodetSekunneiksi vuodet = tunnit * 3600
  where paivat = 365 * vuodet
        tunnit = 24 * paivat

main = print (vuodetSekunneiksi 2)
