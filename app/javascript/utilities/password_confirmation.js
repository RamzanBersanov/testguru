document.addEventListener('turbolinks:load', function() {
    let passwords = document.querySelectorAll(".password")

    if(passwords) {
        passwords.forEach((item) => {
            item.addEventListener('input', function() {
                if(passwords[0].value === passwords[1].value) {
                    document.querySelector('.octicon-passkey-fill').classList.remove('fill_red')
                    document.querySelector('.octicon-passkey-fill').classList.add('fill_green')
                } else {
                    document.querySelector('.octicon-passkey-fill').classList.remove('fill_green')
                    document.querySelector('.octicon-passkey-fill').classList.add('fill_red')
                }
            })
        })
    }
})
