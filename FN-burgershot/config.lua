config = {
    ['precos'] = {
        [1] = {
            preco = 5000,
        },
        [2] = {
            preco = 1000,
        },
        [3] = {
            preco = 500,
        },
        [4] = {
            preco = 100,
        },
    },
}

config.Items = {
    label = "BS drinks",
    slots = 10,
    items = {
        [1] = {
            name = "water_bottle",
            price = 0,
            amount = 100,
            slot = 1,
        }
    }
}

config.bsjob = "burgershot" -- your burgershot job
config.notify = "mythic" -- (put qbcore or mythic) your notify script, for now only qbcore and mythic_notify works

Lang = {
    ['needduty'] = 'You need to be on duty!',
    ['dontingr'] = "You don't have the ingredients!",
    ['donthavetomatos'] = "You lack tomatoes or a kitchen knife",
    ['donthavepotatoes'] = "You lack potatoes or a kitchen knife!",
    ['potatoestowash'] = "You don't have potatoes to wash",
    ['donthavecup'] = "You don't have a cup",
}