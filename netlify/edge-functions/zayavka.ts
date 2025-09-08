import type { Context } from "@netlify/edge-functions";

export default async (req: Request, { cookies, geo }: Context) => {

    const url = new URL(req.url);

    const res = await fetch(
        `https://api.telegram.org/bot8046970932:AAGjylWmUCKvq-tKafcPk9qaDkMqp7g1EhI/sendMessage?chat_id=-1002650810148&text=Имя: ${url.searchParams.get("name")} \n Телефон: ${url.searchParams.get("tel")}`,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Access-Control-Allow-Origin":"https://ti-robots.ru",
            "Access-Control-Allow-Methods" : "GET, OPTIONS",
            "Access-Control-Allow-Headers" : "Accept"
          },
        }
      );
 
    return new Response(JSON.stringify(res), {
      headers: { "content-type": "text/html",
        "Access-Control-Allow-Origin":"https://ti-robots.ru",
        "Access-Control-Allow-Methods" : "GET, OPTIONS",
        "Access-Control-Allow-Headers" : "Accept"
       }
    });
  };
export const config = { path: "/zayavka" };