let count = ref 0

let count_requests inner_handler request =
  count := !count + 1;
  Printf.printf "Request #%d\n%!" !count;
  inner_handler request

let () =
  Dream.run
  @@ Dream.logger
  @@ count_requests
  @@ Dream.router [
    Dream.get "/"
      (fun _ -> Dream.html "Good morning, world!");

    Dream.get "/echo/:word"
      (fun request ->
        Dream.html (Dream.param request "word"))
  ]
