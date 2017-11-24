package models

type Tlaptop struct {
	Merk string `json:"Merk"`
	Jenis string `json:"Jenis"`
	Desc string `json:"Deskripsi"`
	Img string `json:"Gambar"`
}

type Dlaptop []Tlaptop