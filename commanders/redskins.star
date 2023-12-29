load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")

def main():
    ### Image
    skins64 = base64.decode("""iVBORw0KGgoAAAANSUhEUgAAACgAAAAZCAYAAABD2GxlAAAAAXNSR0IArs4c6QAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAUGVYSWZNTQAqAAAACAACARIAAwAAAAEAAQAAh2kABAAAAAEAAAAmAAAAAAADoAEAAwAAAAEAAQAAoAIABAAAAAEAAAAooAMABAAAAAEAAAAZAAAAAPR62YQAAAFZaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJYTVAgQ29yZSA2LjAuMCI+CiAgIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CiAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICAgICAgICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vdGlmZi8xLjAvIj4KICAgICAgICAgPHRpZmY6T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Chle4QcAAATLSURBVEgN7VZLTGNlFP7+20KZ0kJ5Vd5vKLQjmpFMiIkRxwRkJiYmvjJxqUbjQhP3rt2PcTGZjWs3unAyEUxg0Bl1xJhRnsNjYHgNVFoehUJ7e4/n3EupQAe60wUnufe2//3+c77/O+f89wfO7EyB/1YBlS48DSELwYJWQHPgXBqEzmOxvVl1ORKkvoJ8xIwmOOwK9iPYHdqGNzSJx0WNyIHr2HuBi69oIobo+ph6C7EjHtJOAWagkIsPdvfoncVpwDDAA5YRP/LzAG9J9hf88zN2edUg2+cL06T29lI4zQaUl2E5J1j8GrTEx+ur6mrw79R78Wb68gAlxbinXIVvAKHMCMpK6Baux2K48s23qmZsnLXUxKVF1s/afvQhdVF/yZd6RO/ZjcLz3U2Fod8BGxOTyPJ8711ytT+vXwSpn2bn8P71G8oWjzPJ/dUS495+k/BytxrSukObZoAjt/2wR0b5r+oJ/5lXiGuXOkmXgJGIwva2ws6OwoMHwNISfEjor6+uqAu/3gMaGwi7uxZmmzHhdYW/hpXNiNq6QTT6lBdhO5MWH3KJP1l0XS0imo36jjOwRp5I0Hxt6F893YbBjg4WhUnKyuXaYudjE3Az8U+nZ1B6e1ChshLweBjEJhgJPs7Kh8PogNIura0hd3sn5UP81dZwGZRjHLpx35yY5nYiQfXKZijLSTcutlM8J4cOSEpNDg8rLbql6kdGlZ3Tx+oBDfVWCSRJPl4BZueoCgZ9MjyqckR9IZ9c7PkAwemmfomThps5dCJBE0G4W12jHpWVWY6TwUNhYHkJmJwC9vYUJicVJKAolyQg47yQ7O0NVTU6etBnpluXi+BrwQ5s6onpFeDpBMPhxXyPccffkiIoBOrrgJVVIMiXqDIyBlRxmvPzrTSbLPgmC3n4EFjkxQh5MclAdTVQWa4mYIv/YY2mv59KkDs6oWWjNxAg3eGw0my3EwJ+wti4QixuFfvCAm+N3KFCXAgkVWxuIkxMwmwuoZAcP8/zz+UlBtC5tZaemjV6KkETljDuckHPl5YCCQ5eXMR7VwmYoKWeYKJRTvOUMoknlcpzE2q4EUZG1AExwebmElpbEdXsqo/VPyy5AP5lmRHM3pj3FKifWznNRgJobgY2NjjF3ASS3mThB4OAzwe4ub4SjKuttdR8NH84vVIKlRWYgh7nnfNky4igegm65kj0clp1p5Pgb91PbyzVlaJaUyNRVRVIVBPjssDMjLX3yf9kegMBwJlHt9EV4SWdbBkRNF3YjDsceEm+Il7v4fTKe9kDWdlwtpMGmBi5Ob11tbwdjR5Or7nAFtrVstB7WnrFb+YE3ZtzBR78cuUyYZM/SsvLqdRKOuvrgVIv3Yeia75m7AT8lmJzcymcNE9FBXd7FX/tNftvQuA0y5igakc8i7vZ74cxO6eQxScXKXa5RK1n2wgOF/XDhoHKCpro6SYsLjJJJiV7XhL7TBvPc9MgOoNcwafb0QPSyTMM7UcFY/LFF6j0uQusTBLNP7jDI7wh/aC6QuuJm0W9Ph81FBbyN7qRUjjGl3gR1xTdyiS94v4gRjLWSU/6mvXJK2yBXTmPHdR2+Uy3aZ3p6HuXF4ajhk+VOI7TE4jnjqtXl/jLfGZnCvz/FfgHnVzzSPSa/EEAAAAASUVORK5CYII=""")

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