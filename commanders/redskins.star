load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")

coinDesk = "https://api.coindesk.com/v1/bpi/currentprice.json"
def main():

    ### Api 
    resp = http.get(coinDesk, ttl_seconds = 240)
    if resp.status_code != 200:
        fail("Coindesk request failed with status %d", resp.status_code)
    rate = resp.json()["bpi"]["USD"]["rate_float"]
    # for development purposes: check if result was served from cache or not
    if resp.headers.get("Tidbyt-Cache-Status") == "HIT":
        print("Hit! Displaying cached data.")
    else:
        print("Miss! Calling CoinDesk API.")

    ### Image
    skins64 = base64.decode("""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""")

    ### Return
    return render.Root(
        child = render.Stack(
            children=[
                render.Box(color="#5A1414"),
                render.Box(
                    render.Row(
                        expanded = True,
                        main_align="space_evenly",
                        cross_align="center",
                        children = [
                            render.Image(src=skins64)
                            # Add additions here
                        ]
                    )
                )
            ]
        )
    )