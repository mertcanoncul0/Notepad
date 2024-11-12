import db from "../utils/db";
import { randomBytes, createHash } from "crypto";

class User {
  // Şifreyi hashlemek için bir fonksiyon
  private hashPassword(password: string, salt: string): string {
    return createHash("sha256").update(password + salt).digest("hex");
  }

  public async createUser(req: Request) {
    try {
      const { username, email, password } = await req.json();

      if (!username || !email || !password) {
        return new Response("Lütfen tüm alanları doldurun!", { status: 400 });
      }

      // Şifre için salt oluştur ve şifreyi hashle
      const salt = randomBytes(16).toString("hex");
      const hashedPassword = this.hashPassword(password, salt);

      // Yeni kullanıcıyı ekle
      await db.query("INSERT INTO users (username, email, password) VALUES (?, ?, ?)", [
        username,
        email,
        hashedPassword,
      ]);

      return new Response("Kullanıcı başarıyla oluşturuldu!");
    } catch (error) {
      console.error(error);
      return new Response("Sunucu hatası", { status: 500 }) ;
    }
  }

  public async getUsers() {
    try {
      const users = await db.query("SELECT id, username, email FROM users"); // Şifre hash'ini döndürmüyoruz
      return new Response(JSON.stringify(users[0]), { status: 200, headers: { "Content-Type": "application/json" } });
    } catch (error) {
      console.error(error);
      return new Response("Sunucu hatası", { status: 500 });
    }
  }
}

export default User;
