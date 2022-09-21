import React, { Fragment } from 'react'

import FilterCompo from './FilterCompo'

const FiltersCompo = ({ filters }) => {
    return (
        <Fragment>
            {filters.map((filter) => (
                <FilterCompo filter={filter} key={filter.key} />
            ))}
        </Fragment>
    )
}

export default FiltersCompo
