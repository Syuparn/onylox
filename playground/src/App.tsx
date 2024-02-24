import { Flex, HStack, Heading, Link, Spacer, Text } from '@chakra-ui/react'
import Form from './Form'
import RunButton from './RunButton'
import { useState } from 'react'

function App() {
  const [input, setInput] = useState('print "Hello, world!";')
  const [output, setOutput] = useState('')

  return (
    <>
      <Flex>
        <Heading as='h1' size='2xl' mb='0.5em'>
          Lox Playground
        </Heading>
        <Spacer />
        <RunButton label='Run' />
      </Flex>
      <Text>Implemented in <Link href='https://onyxlang.io/'>Onyx</Link> (WebAssembly)</Text>
      <Text>NOTE: This is unofficial!</Text>
      <HStack>
        <Form label='input' value={input} setValue={setInput} isReadOnly={false}/>
        <Form label='output' value={output} setValue={setOutput} isReadOnly={true}/>
      </HStack>
    </>
  )
}

export default App
