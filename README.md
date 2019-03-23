# Oregon Department of Forestry Recreation Opportunities

<https://odfrec.herokuapp.com>

This is the code for a reader-friendly list of recreational opportunities
provided by the Oregon Department of Forestry. It uses [public data provided
through data.oregon.gov][odf-data-source]. The dataset in use here was made
available on February 22, 2019.

I started this project to help kickstart Code for Clatsop, a civic hacking
initiative based in Astoria, Oregon. It's also a personal learning project for
me, but I'm open to collaboration if interest arises.

## Future ideas

- Add filtering interface to narrow results by state forest or type of
  opportunity
  - Server-rendered UI to start, front-end app later
- Add geocoding/search by distance
- Add a map view
- Parse availability date ranges provided in dataset, so they can be used
  to filter by date
- Include images of opportunities/state forests, based on location data, as
  available through public domain/Creative Commons
- Handle data updates (the importer is currently create-only), can be
  deferred until updated data are available
- Create setup script and instructions to make it easier for others to
  collaborate on this project

[odf-data-source]: https://data.oregon.gov/Recreation/ODF-Recreational-Opportunities/ufw2-6prx
