package appy_test

import (
	"testing"

	"github.com/appist/appy"
)

type AppSuite struct {
	appy.TestSuite
}

func (s *AppSuite) TestNewApp() {
	app := appy.NewApp(nil)

	s.NotNil(app.Asset())
	s.NotNil(app.Config())
	s.NotNil(app.I18n())
	s.NotNil(app.Logger())
}

func TestAppSuite(t *testing.T) {
	appy.RunTestSuite(t, new(AppSuite))
}
