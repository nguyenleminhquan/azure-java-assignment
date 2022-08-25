const axios = require('axios')
const { exit } = require('process')

const config = {
  headers: {
    'Authorization': `Basic ${process.argv[2]}`,
    'Cookie': `${process.argv[3]}`,
    'Content-Type': 'application/json'
  }
}

const APIGetCount = 'https://dev.azure.com/mps-hautp2/demo-azure/_apis/build/builds?api-version=6.0&statusFilter=inProgress'
const APIGetStatus = 'https://dev.azure.com/mps-hautp2/demo-azure/_apis/build/builds?api-version=6.0&$top=1'

var intervel = setInterval(checkCount, 2000)

function checkStatus() {
  axios.get(APIGetStatus, config)
  .then(res => {
    const data = res.data.value[0].result
    if (data == 'succeeded') {
      console.log('Succeed')
      clearInterval(intervel)
    } else {
      exit(1)
    }
  })
  .catch(err => console.log(err))
}

function checkCount() {
  axios.get(APIGetCount, config)
  .then(res => {
    const data = res.data
    if (data.count == 0) {
      checkStatus()
    } else {
      console.log('Waiting')
    }
  })
  .catch(err => console.log(err))
}



