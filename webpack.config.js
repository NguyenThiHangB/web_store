var webpack = require("webpack");

const paths = {
  js: __dirname + "/app/assets/javascripts",
  jsx: __dirname + "/app/jsx",
}

module.exports = {
  entry: paths.jsx + "/bootstrap.jsx",
  output: {
    path: paths.js,
    filename: "react-app.js",
  },
  module: {
    rules: [{
      exclude: /(node_modules|bower_components)/,
      test: /\.jsx?$/,
      use: {
        loader: "babel-loader"
      }
    }, {
      test: /\.json$/,
      include: /node_modules/,
      loader: 'json-loader'
    }, {
      test: /\.css$/,
      loader: 'style!css'
    }]
  },
  plugins: [
    new webpack.ProvidePlugin({
      React: "react",
      PropTypes: "prop-types",
      update: "react-addons-update",
      mui: "material-ui",
      t: "counterpart",
      config: __dirname + "/config/react_app",
   }),
  ],
}
