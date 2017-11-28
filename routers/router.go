package routers

import (
"lasti/controllers"
"github.com/astaxie/beego"
)

func init() {
	beego.Router("/index", &controllers.MainController{})
	beego.Router("/login", &controllers.LoginController{})
	beego.Router("/register", &controllers.RegController{})
	beego.Router("/home", &controllers.HomeController{})
	beego.Router("/katalog", &controllers.CatController{})
	beego.Router("/chat", &controllers.ChatController{})
	beego.Router("/form", &controllers.FormController{})
	beego.Router("/tanya", &controllers.TanyaController{})
	beego.Router("/faq", &controllers.FAQController{})
	beego.Router("/cart", &controllers.CartController{})
	beego.Router("/invoice", &controllers.InvController{})
	beego.Router("/laptop", &controllers.LaptopController{})
}
