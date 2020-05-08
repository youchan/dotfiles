function! DocbasePost(body)
  let s:V = vital#vital#new()
  let s:HTTP = s:V.import("Web.HTTP")
  let s:JSON = s:V.import("Web.JSON")

  let s:ACCESS_TOKEN="jEzvGqFUz-gkCxHopx-X"

  let url = "https://api.docbase.io/teams/retrieva/posts"

  let header = {
          \ "X-DocBaseToken": s:ACCESS_TOKEN,
          \ "Content-Type": "application/json"
        \ }

  let param = {
          \ "title": "メモのタイトル",
          \ "body": a:body,
          \ "draft": s:JSON.true,
          \ "tags": [],
          \ "scope": "private",
          \ "groups": [],
          \ "notice": s:JSON.false
        \ }

  return s:HTTP.request(
          \ "POST",
          \ url,
          \ {
              \ "headers": header,
              \ "data": s:JSON.encode(param)
          \ },
        \ )
endfunction
