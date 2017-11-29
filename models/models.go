package models

type Tuser struct {
	Nama string `form:"name"`
	Email string `form:"email"`
	Tlp string `form:"telepon"`
	Password string `form:"password"`
}

type Duser []Tuser

type Tlaptop struct {
	ID string `json:"ID"`
	Merk string `json:"Merk"`
	Tipe string `json:"Tipe"`
	Desc string `json:"Deskripsi"`
	Img string `json:"Gambar"`
}

type Dlaptop []Tlaptop

type Tcart struct{
	Merk string `json:"Merk"`
	Tipe string `json:"Tipe"`
	Qty int `json:"QTY"`
	Harga int `json:"Harga"`
	Garansi string `json:"Garansi"`
	Status string `json:"Status"`
}

type Dcart []Tcart