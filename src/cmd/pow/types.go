package main

import "time"

type ShortUrl struct {
	Id      string
	Url     string
	Created time.Time
	Updated time.Time
}

type Stats struct {
	Total  int64
	Daily  map[string]int64
	Hourly map[string]int64
	DOTWly map[string]int64
}
