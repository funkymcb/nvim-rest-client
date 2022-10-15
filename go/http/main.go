package main

import (
	"github.com/go-resty/resty/v2"
	"github.com/neovim/go-client/nvim/plugin"
)

// get recieves method and uri and performs a simple get request
func request(args []string) (string, error) {
	// method := args[0]
	uri := args[1]

	client := resty.New()

	resp, err := client.R().Get(uri)
	if err != nil {
		return resp.String(), err
	}

	return resp.String(), nil
}

func main() {
	plugin.Main(func(p *plugin.Plugin) error {
		p.HandleFunction(&plugin.FunctionOptions{Name: "NvimRestClientRequest"},
			request,
		)
		return nil
	})
}
