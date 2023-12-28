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
    smile64 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAlklEQVQ4T2NkwAH+H2T/jy7FaP+TEZtyDEG4Zi0TTPXXzoDF0A1DMQRsADbN6MZdO4NiENwQbAbERh1lWLzMmgFGo5iFZBDYEFwuwGsISCPUIKyGgDRjAyBXYXMNIz5XgDQga8TpLboYgux8DO/AwoUuLiEqTLBFMcmxQ7V0gssgklIsLAYozjsoBoE45OZi5DRBSnkCAMLhlPBiQGHlAAAAAElFTkSuQmCC")

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
                            render.Image(src=smile64), 
                            render.Text("$%d" % rate),
                        ]
                    )
                )
            ]
        )
        
        
    )