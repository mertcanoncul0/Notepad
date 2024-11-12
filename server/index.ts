import User from "./controllers/users";
const UserCont = new User();

Bun.serve({
  port: Bun.env.PORT || 8080,
  fetch: (req: Request) => {
    const url = new URL(req.url)
    
    
    if (url.pathname === "/users" && req.method === "POST") {
      return UserCont.createUser(req)
    } 

    if (url.pathname === "/users" && req.method === "GET") {
      return UserCont.getUsers()
    }

    return new Response("Hello, World!")
  }
})

console.log(`Hello via Bun! 🚀 http://localhost:${Bun.env.PORT || 8080}`);