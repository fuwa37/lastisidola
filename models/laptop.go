package models

type Tlaptop struct {
	Merk string `json:"Merk"`
	Tipe string `json:"Tipe"`
	Desc string `json:"Deskripsi"`
	Img string `json:"Gambar"`
}

type Dlaptop []Tlaptop