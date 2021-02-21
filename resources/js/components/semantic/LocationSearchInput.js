import React from 'react';
import PlacesAutocomplete, {
  geocodeByAddress,
  getLatLng,
} from 'react-places-autocomplete';
 
class LocationSearchInput extends React.Component {
  constructor(props) {
    super(props);
    this.state = { address: '',zipCode:'' };
  }
 
  handleChange = address => {
    this.setState({ address });
  };
  handleSelect = address => {
    geocodeByAddress(address)
      .then(results => //getLatLng(results[0])
      
      {
        let postalCode = "",
          country = "",
          country_code = "",
          state = "",
          locality = "";
        results[0].address_components.forEach(data => {
          if (data.types.includes("postal_code")) {
            postalCode = data.long_name;
          } else if (data.types.includes("country")) {
            country = data.long_name;
            country_code = data.short_name;
          } else if (data.types.includes("administrative_area_level_1")) {
            state = data.long_name;
          } else if (data.types.includes("locality")) {
            locality = data.long_name;
          }
        });
        return getLatLng(results[0]);
      }
      
      )
      .then(latLng => console.log('Success', latLng))
      .catch(error => console.error('Error', error));
  };
 
  render() {
    return (
      <div>
    <h1>{this.state.address}</h1><br/>
    <h1>Here is zipcode {this.state.zipCode}</h1>
     <PlacesAutocomplete
        value={this.state.address}
        onChange={this.handleChange}
        onSelect={this.handleSelect}
      >
        {({ getInputProps, suggestions, getSuggestionItemProps, loading }) => (
          <div>
            <input
              {...getInputProps({
                placeholder: 'Search Places ...',
                className: 'location-search-input',
              })}
            />
            <div className="autocomplete-dropdown-container">
              {loading && <div>Loading...</div>}
              {suggestions.map(suggestion => {
                const className = suggestion.active
                  ? 'suggestion-item--active'
                  : 'suggestion-item';
                // inline style for demonstration purpose
                const style = suggestion.active
                  ? { backgroundColor: '#fafafa', cursor: 'pointer' }
                  : { backgroundColor: '#ffffff', cursor: 'pointer' };
                return (
                  <div
                    {...getSuggestionItemProps(suggestion, {
                      className,
                      style,
                    })}
                  >
                    <span>{suggestion.description}</span>
                  </div>
                );
              })}
            </div>
          </div>
        )}
      </PlacesAutocomplete>
      </div>
    );
  }
}

export default LocationSearchInput;