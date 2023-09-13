document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')
  
  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  let table = document.querySelector('table')

  const rows = table.querySelectorAll('tr')
  let sortedRows = []

  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  let sortedTable = document.createElement('table')
  let thead = document.createElement('thead')
  let tbody = document.createElement('tbody')

  sortedTable.classList.add('table')

  thead.appendChild(table.querySelector('tr')) 
  sortedTable.appendChild(thead)

  for (let i = 0; i < sortedRows.length; i++) {
    tbody.appendChild(sortedRows[i])
  }

  sortedTable.appendChild(tbody)

  table.parentNode.replaceChild(sortedTable, table)

  function compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
  }

  function compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
  }
}
