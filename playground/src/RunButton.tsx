import { Button } from "@chakra-ui/react";

type Props = {
  label: string;
  onClick: () => void;
}

function RunButton(props: Props) {
  return (
    <>
      <Button
        size="lg"
        mt="0.4em"
        colorScheme="blackAlpha"
        onClick={props.onClick}
      >
        {props.label}
      </Button>
    </>
  )
}

export default RunButton
