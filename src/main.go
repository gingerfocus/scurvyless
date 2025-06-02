package main

import (
	"html/template"
	"io"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"

	"github.com/google/uuid"
)

/// Wrap go templates for echo
type Templates struct  {
    templates *template.Template
}
func (t *Templates) Render(w io.Writer, name string, data interface{}, c echo.Context)  error {
    return t.templates.ExecuteTemplate(w, name, data)
}
func newTemplate() *Templates {
    return &Templates{
        templates: template.Must(template.ParseGlob("views/*.html")),
    }
}

type Link struct {
    Site string
    Title string
    Brief string
}

type Search struct {
    Query string
    // File string
    Links []Link
}

func newSearch(query string) Search {
    return Search{
        Query: query,
        Links: []Link{
            {
                Site: "Example",
                Title: "Result Title 1",
                Brief: "This is a fake description for the first search result.",
            },
            {
                Site: "https://gingerfocus.dev/blog",
                Title: "Gingerfocus Blog",
                Brief: "the smartest place on the internet",
            },
            {
                Site: "https://github.com",
                Title: "github",
                Brief: "see this things source code or somethign else idk",
            },
        },
    }
}

var searchCache = make(map[string]Search)

func main() {
    e := echo.New()
    e.Use(middleware.Logger())

    e.Renderer = newTemplate()

    search(e)

    e.Static("/", "public")

    e.Logger.Fatal(e.Start(":6969"))
}

func search(e *echo.Echo) {
    e.GET("/search", func(c echo.Context) error {
        paramid := c.QueryParam("id");
        if paramid != "" {
            search, ok := searchCache[paramid]
            if !ok {
                return c.JSON(200, "not an id")
            }

            // TODO: try lookup

            return c.Render(200, "search-page", search)
        }

        return c.Render(200, "index", nil)
    })

    e.POST("/search", func(c echo.Context) error {
        search := c.FormValue("search")
        // return c.JSON(200, search)

        // file, err := c.FormFile("file")
        // if err != nil { return c.JSON(500, "opps") }
        //
        // src, err := file.Open()
        // if err != nil { return c.JSON(500, "opps") }
        // defer src.Close()
        //
        // buf := new(bytes.Buffer)
        // _, err = io.Copy(buf, src)
        // if err != nil { return c.JSON(500, "failed to read file") }
        //
        // decoded := string(buf.Bytes())

        newid := uuid.New().String()

        searchCache[newid] = newSearch(search)

        c.Response().Header().Add("HX-Redirect", "/search?id="+newid)
        return c.JSON(200, newid)
    })
}
